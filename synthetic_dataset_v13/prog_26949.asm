; DESCRIPTION: Renders a white box of size 86x90 starting at (68, 82).
; PLAN: r0=68(x), r1=82(y), r2=86(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 82
LDI r2, 86
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
