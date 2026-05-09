; DESCRIPTION: Renders a cyan box of size 15x28 starting at (42, 146).
; PLAN: r0=42(x), r1=146(y), r2=15(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 146
LDI r2, 15
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
