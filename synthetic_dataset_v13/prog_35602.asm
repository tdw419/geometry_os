; DESCRIPTION: Places a yellow 30x63 rectangle at position (298, 94).
; PLAN: r0=298(x), r1=94(y), r2=30(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 94
LDI r2, 30
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
