; DESCRIPTION: Renders a magenta box of size 77x17 starting at (295, 152).
; PLAN: r0=295(x), r1=152(y), r2=77(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 152
LDI r2, 77
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
