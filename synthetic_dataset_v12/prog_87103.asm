; DESCRIPTION: Renders a cyan box of size 34x111 starting at (79, 144).
; PLAN: r0=79(x), r1=144(y), r2=34(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 144
LDI r2, 34
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
