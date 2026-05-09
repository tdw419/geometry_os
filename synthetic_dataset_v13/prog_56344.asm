; DESCRIPTION: Renders a cyan box of size 39x112 starting at (369, 109).
; PLAN: r0=369(x), r1=109(y), r2=39(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 109
LDI r2, 39
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
