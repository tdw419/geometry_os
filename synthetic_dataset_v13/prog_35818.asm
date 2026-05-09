; DESCRIPTION: Places a black 22x52 rectangle at position (243, 142).
; PLAN: r0=243(x), r1=142(y), r2=22(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 142
LDI r2, 22
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
