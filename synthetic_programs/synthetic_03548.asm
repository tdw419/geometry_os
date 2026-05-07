; math computation
; initialization
  LDI r4, 0x0F507C
  LDI r5, 2796
  LDI r0, 0xAE900D
  ADD r12, r14, r11
  ADD r10, r2, r15
  SHR r6, r4, r11
  SAR r7, r0, r15
  SHL r12, r5, r7
  SHL r8, r14, r13
  SHL r1, r10, r13
  SHL r7, r1, r2
  SHR r8, r2, r12
  SHR r7, r0, r5
  SHR r12, r2, r13
  SAR r1, r3, r8
  SHL r7, r17, r9
  ADD r0, r6, r10
  CMPI r3, r7, 0x77D13B
  OR r9, r7, r12
  CMPI r0, r4, 234
  OR r9, r6, r10
  OR r7, r1, r11
  SHR r2, r9, r5
  SHL r1, r7, r4
  SHL r2, r5, r15
  SUBI r8, r18, 128
  CMPI r12, r9, 128
  SHR r1, r10, r16
  SAR r2, r9, r13
  SHLI r22, r11, 0
  SHL r23, r15, r7
  SHR r0, r13, r2
  SAR r9, r29, r11
  SHR r8, r3, r2
  SHL r31, r12, r10
  SHL r9, r13, r5
  SHR r7, r3, r5
  MOD r10, r9, r15
  ADDI r13, r4, 256
  HALT
