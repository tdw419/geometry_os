; DESCRIPTION: Renders a cyan box of size 57x86 starting at (142, 91).
; PLAN: r0=142(x), r1=91(y), r2=57(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 91
LDI r2, 57
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
