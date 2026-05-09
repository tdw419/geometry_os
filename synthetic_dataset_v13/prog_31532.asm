; DESCRIPTION: Renders a cyan box of size 65x67 starting at (382, 13).
; PLAN: r0=382(x), r1=13(y), r2=65(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 13
LDI r2, 65
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
