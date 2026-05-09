; DESCRIPTION: Renders a cyan box of size 12x90 starting at (412, 157).
; PLAN: r0=412(x), r1=157(y), r2=12(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 157
LDI r2, 12
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
