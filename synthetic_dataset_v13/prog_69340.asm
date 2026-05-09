; DESCRIPTION: Places a yellow 65x104 rectangle at position (146, 52).
; PLAN: r0=146(x), r1=52(y), r2=65(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 52
LDI r2, 65
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
