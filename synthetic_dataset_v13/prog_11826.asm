; DESCRIPTION: Renders a cyan box of size 91x27 starting at (402, 228).
; PLAN: r0=402(x), r1=228(y), r2=91(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 228
LDI r2, 91
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
