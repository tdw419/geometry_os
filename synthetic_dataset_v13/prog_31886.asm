; DESCRIPTION: Renders a cyan box of size 28x31 starting at (107, 111).
; PLAN: r0=107(x), r1=111(y), r2=28(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 111
LDI r2, 28
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
