; DESCRIPTION: Places a cyan 99x65 rectangle at position (300, 115).
; PLAN: r0=300(x), r1=115(y), r2=99(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 115
LDI r2, 99
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
