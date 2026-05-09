; DESCRIPTION: Places a yellow 68x33 rectangle at position (392, 175).
; PLAN: r0=392(x), r1=175(y), r2=68(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 175
LDI r2, 68
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
