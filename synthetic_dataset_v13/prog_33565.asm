; DESCRIPTION: Renders a green box of size 109x86 starting at (262, 128).
; PLAN: r0=262(x), r1=128(y), r2=109(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 128
LDI r2, 109
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
