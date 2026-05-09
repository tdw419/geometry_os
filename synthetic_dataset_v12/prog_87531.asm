; DESCRIPTION: Renders a cyan box of size 103x94 starting at (290, 152).
; PLAN: r0=290(x), r1=152(y), r2=103(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 152
LDI r2, 103
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
