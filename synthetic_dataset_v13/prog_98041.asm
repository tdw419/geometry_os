; DESCRIPTION: Renders a red box of size 32x112 starting at (180, 111).
; PLAN: r0=180(x), r1=111(y), r2=32(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 111
LDI r2, 32
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
