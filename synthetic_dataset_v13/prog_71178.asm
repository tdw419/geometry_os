; DESCRIPTION: Renders a cyan box of size 50x72 starting at (176, 111).
; PLAN: r0=176(x), r1=111(y), r2=50(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 111
LDI r2, 50
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
