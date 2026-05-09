; DESCRIPTION: Renders a cyan box of size 104x10 starting at (102, 242).
; PLAN: r0=102(x), r1=242(y), r2=104(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 242
LDI r2, 104
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
