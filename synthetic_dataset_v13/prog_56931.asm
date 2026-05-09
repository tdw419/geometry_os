; DESCRIPTION: Renders a red box of size 32x27 starting at (186, 141).
; PLAN: r0=186(x), r1=141(y), r2=32(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 141
LDI r2, 32
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
