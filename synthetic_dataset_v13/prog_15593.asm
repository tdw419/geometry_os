; DESCRIPTION: Renders a cyan box of size 116x51 starting at (227, 111).
; PLAN: r0=227(x), r1=111(y), r2=116(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 111
LDI r2, 116
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
