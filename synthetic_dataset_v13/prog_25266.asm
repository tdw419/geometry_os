; DESCRIPTION: Places a cyan 55x109 rectangle at position (3, 23).
; PLAN: r0=3(x), r1=23(y), r2=55(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 23
LDI r2, 55
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
