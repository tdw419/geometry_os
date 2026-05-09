; DESCRIPTION: Renders a cyan box of size 103x57 starting at (236, 62).
; PLAN: r0=236(x), r1=62(y), r2=103(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 62
LDI r2, 103
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
