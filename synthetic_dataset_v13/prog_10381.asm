; DESCRIPTION: Renders a cyan box of size 111x30 starting at (381, 9).
; PLAN: r0=381(x), r1=9(y), r2=111(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 9
LDI r2, 111
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
