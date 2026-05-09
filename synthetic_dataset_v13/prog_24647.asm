; DESCRIPTION: Renders a red box of size 94x87 starting at (274, 117).
; PLAN: r0=274(x), r1=117(y), r2=94(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 117
LDI r2, 94
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
