; DESCRIPTION: Renders a cyan box of size 43x96 starting at (403, 111).
; PLAN: r0=403(x), r1=111(y), r2=43(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 111
LDI r2, 43
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
