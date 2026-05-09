; DESCRIPTION: Renders a red box of size 21x32 starting at (186, 120).
; PLAN: r0=186(x), r1=120(y), r2=21(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 120
LDI r2, 21
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
