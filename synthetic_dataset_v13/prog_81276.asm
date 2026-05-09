; DESCRIPTION: Places a black 33x35 rectangle at position (243, 91).
; PLAN: r0=243(x), r1=91(y), r2=33(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 91
LDI r2, 33
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
