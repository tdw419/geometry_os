; DESCRIPTION: Renders a cyan box of size 36x96 starting at (126, 111).
; PLAN: r0=126(x), r1=111(y), r2=36(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 111
LDI r2, 36
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
