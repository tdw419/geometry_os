; DESCRIPTION: Renders a cyan box of size 92x111 starting at (79, 74).
; PLAN: r0=79(x), r1=74(y), r2=92(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 74
LDI r2, 92
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
