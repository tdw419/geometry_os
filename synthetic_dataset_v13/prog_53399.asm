; DESCRIPTION: Renders a green box of size 83x92 starting at (308, 150).
; PLAN: r0=308(x), r1=150(y), r2=83(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 150
LDI r2, 83
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
