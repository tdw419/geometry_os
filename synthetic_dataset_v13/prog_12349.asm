; DESCRIPTION: Renders a green box of size 82x48 starting at (316, 143).
; PLAN: r0=316(x), r1=143(y), r2=82(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 143
LDI r2, 82
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
