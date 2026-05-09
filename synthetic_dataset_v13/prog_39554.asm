; DESCRIPTION: Renders a red box of size 89x30 starting at (260, 111).
; PLAN: r0=260(x), r1=111(y), r2=89(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 111
LDI r2, 89
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
