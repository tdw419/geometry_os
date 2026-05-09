; DESCRIPTION: Places a yellow 92x65 rectangle at position (229, 172).
; PLAN: r0=229(x), r1=172(y), r2=92(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 172
LDI r2, 92
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
