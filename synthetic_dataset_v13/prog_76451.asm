; DESCRIPTION: Places a cyan 45x17 rectangle at position (306, 210).
; PLAN: r0=306(x), r1=210(y), r2=45(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 210
LDI r2, 45
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
