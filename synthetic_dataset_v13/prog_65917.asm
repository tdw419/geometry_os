; DESCRIPTION: Renders a cyan box of size 109x39 starting at (229, 92).
; PLAN: r0=229(x), r1=92(y), r2=109(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 92
LDI r2, 109
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
