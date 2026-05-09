; DESCRIPTION: Renders a cyan box of size 102x25 starting at (237, 24).
; PLAN: r0=237(x), r1=24(y), r2=102(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 24
LDI r2, 102
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
