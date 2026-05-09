; DESCRIPTION: Renders a magenta box of size 104x120 starting at (177, 75).
; PLAN: r0=177(x), r1=75(y), r2=104(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 75
LDI r2, 104
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
