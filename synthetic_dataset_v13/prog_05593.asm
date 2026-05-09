; DESCRIPTION: Renders a green box of size 72x116 starting at (317, 50).
; PLAN: r0=317(x), r1=50(y), r2=72(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 50
LDI r2, 72
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
