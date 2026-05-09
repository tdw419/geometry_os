; DESCRIPTION: Composite: Places a white 92x64 rectangle at position (102, 164) then Places a green dot at position (368, 190).
; PLAN: r0=102(x), r1=164(y), r2=92(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=190(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 164
LDI r2, 92
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 190
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
