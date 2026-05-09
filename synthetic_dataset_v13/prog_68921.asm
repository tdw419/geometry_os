; DESCRIPTION: Renders a green box of size 30x50 starting at (29, 143).
; PLAN: r0=29(x), r1=143(y), r2=30(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 143
LDI r2, 30
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
