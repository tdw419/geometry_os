; DESCRIPTION: Renders a green box of size 86x82 starting at (246, 150).
; PLAN: r0=246(x), r1=150(y), r2=86(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 150
LDI r2, 86
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
