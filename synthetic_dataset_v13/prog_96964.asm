; DESCRIPTION: Places a cyan 55x31 rectangle at position (187, 25).
; PLAN: r0=187(x), r1=25(y), r2=55(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 25
LDI r2, 55
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
