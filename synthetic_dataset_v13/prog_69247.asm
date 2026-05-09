; DESCRIPTION: Places a yellow 29x106 rectangle at position (298, 150).
; PLAN: r0=298(x), r1=150(y), r2=29(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 150
LDI r2, 29
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
