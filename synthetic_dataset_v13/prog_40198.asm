; DESCRIPTION: Renders a cyan box of size 61x63 starting at (56, 73).
; PLAN: r0=56(x), r1=73(y), r2=61(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 73
LDI r2, 61
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
