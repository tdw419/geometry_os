; DESCRIPTION: Renders a purple box of size 102x56 starting at (214, 174).
; PLAN: r0=214(x), r1=174(y), r2=102(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 174
LDI r2, 102
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
