; DESCRIPTION: Places a cyan 19x65 rectangle at position (174, 12).
; PLAN: r0=174(x), r1=12(y), r2=19(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 12
LDI r2, 19
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
