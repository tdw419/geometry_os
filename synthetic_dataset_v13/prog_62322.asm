; DESCRIPTION: Renders a cyan box of size 55x44 starting at (208, 163).
; PLAN: r0=208(x), r1=163(y), r2=55(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 163
LDI r2, 55
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
