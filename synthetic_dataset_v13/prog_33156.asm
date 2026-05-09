; DESCRIPTION: Places a cyan 27x66 rectangle at position (185, 175).
; PLAN: r0=185(x), r1=175(y), r2=27(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 175
LDI r2, 27
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
