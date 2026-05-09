; DESCRIPTION: Renders a green box of size 42x45 starting at (242, 144).
; PLAN: r0=242(x), r1=144(y), r2=42(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 144
LDI r2, 42
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
