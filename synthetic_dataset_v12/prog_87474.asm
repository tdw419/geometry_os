; DESCRIPTION: Renders a blue box of size 117x48 starting at (150, 111).
; PLAN: r0=150(x), r1=111(y), r2=117(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 111
LDI r2, 117
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
