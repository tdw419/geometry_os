; DESCRIPTION: Renders a cyan box of size 57x40 starting at (374, 163).
; PLAN: r0=374(x), r1=163(y), r2=57(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 163
LDI r2, 57
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
