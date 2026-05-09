; DESCRIPTION: Places a yellow 12x104 rectangle at position (446, 47).
; PLAN: r0=446(x), r1=47(y), r2=12(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 47
LDI r2, 12
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
