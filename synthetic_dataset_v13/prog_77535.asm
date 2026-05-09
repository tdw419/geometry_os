; DESCRIPTION: Renders a magenta box of size 28x61 starting at (408, 152).
; PLAN: r0=408(x), r1=152(y), r2=28(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 152
LDI r2, 28
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
