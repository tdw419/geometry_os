; DESCRIPTION: Renders a cyan box of size 31x111 starting at (450, 106).
; PLAN: r0=450(x), r1=106(y), r2=31(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 106
LDI r2, 31
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
