; DESCRIPTION: Renders a cyan box of size 80x81 starting at (292, 111).
; PLAN: r0=292(x), r1=111(y), r2=80(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 111
LDI r2, 80
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
